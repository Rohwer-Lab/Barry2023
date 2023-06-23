
import dill as pickle
filename = 'session_identi_koff_Kdapp_PRDX1.pkl'
pickle.load_session(filename)

identi_koff_Kdapp = conf_interval(koff_Kdapp_Minimizer, 
                                  fit_koff_Kdapp_to_data, 
                                  prob=0.95, 
                                  limits=0.5, 
                                  log=False, 
                                  points=21, 
                                  return_CIclass=True) 

pickle.dump(identi_koff_Kdapp[1],open("identi_koff_Kdapp_PRDX1.pkl","wb"))
print("Script completed")
