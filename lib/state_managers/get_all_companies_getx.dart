import 'package:get/get.dart';
import 'package:working_with_getx/data/models/companies_model/companies_model.dart';
import 'package:working_with_getx/data/models/my_response/my_response.dart';
import 'package:working_with_getx/data/repositories/companies_repository.dart';


class GetAllCompaniesGetX extends GetxController {

  GetAllCompaniesGetX({required this.companiesRepository}){
    fetchAllCompanies();
  }
  final CompaniesRepository companiesRepository;

  final RxInt count = 0.obs;

  final RxBool isLoading = false.obs;

  CompaniesModel? companiesModel;

  final RxString error = ''.obs;


  fetchAllCompanies() async {
    showLoader();
    MyResponse myResponse = await companiesRepository.getAllCompanies();
    if(myResponse.error.isEmpty){
      companiesModel = await myResponse.data ;
      hideLoader();
    }else{
      error.value = myResponse.error;
    }
  }

  showLoader() {
    isLoading.value = true;
  }

  hideLoader() {
    isLoading.value = false;
  }
}