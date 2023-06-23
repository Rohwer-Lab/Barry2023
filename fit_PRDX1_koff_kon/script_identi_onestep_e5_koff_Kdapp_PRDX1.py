
import dill as pickle
filename = 'session_identi_onestep_e5_koff_Kdapp_PRDX1.pkl'
pickle.load_session(filename)

identi_onestep_e5_koff_Kdapp = conf_interval(onestep_e5_koff_Kdapp_Minimizer, 
                  fit_onestep_e5_koff_Kdapp_to_data, 
                  prob=0.95, limits=0.5, log=False, points=21, return_CIclass=True) 

pickle.dump(identi_onestep_e5_koff_Kdapp[1],open("identi_onestep_e5_koff_Kdapp_PRDX1.pkl","wb"))
print("Script completed")
