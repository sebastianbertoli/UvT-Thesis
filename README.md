# UvT-Thesis
This is the GitHub repository of my MSc in Datascience: Business and Governance. More to come soon.

The aim of the present thesis is to predict a vessel’s type[1] using historic vessel navigation data and using a supervised learning approach. This historic navigation data used in this thesis was generated by vessels’ *Automatic Identification System* (AIS) which broadcast identification and navigation data . Ever since 2004 many vessels are required to be equipped with an AIS.[2] This requirement has led to an increased availability of AIS data.

The increased availability of historical AIS data has led to new opportunities for research. AIS data has been used for research on ship tracking and surveillance , risk management , spatial network analysis , environmental planning as well as maritime route prediction and anomaly detection . Finally investigations on AIS data themselves have also become a foray for researchers .

Classifying vessels can be seen as a sub-problem of many of the aforementioned topics whose importance can hardly be overstated: taking into account the vessel type makes vessel movement models more specific and therefore improves their overall quality .

This is particularly relevant in the context of anomaly detection research which entails ’the detection of events that deviate qualitatively from what is considered to be normal \[...\]’ . The reason being that vessels of different type and sizes tend to navigate at different speeds and take diverging navigational paths . Just like a lorry driving on a highway would ’navigate’ quite differently to, for instance, a utility car in a small city with tight twisting streets. As such, behaviour that may seem normal for one type of vessels in a particular maritime area, may not be so for another type of vessels in another maritime area.

Given that the prototypical AIS signal already includes information on the type of vessel broadcasting it, one may wonder about the usefulness of trying to predict it in the first place. After all, why would one try to predict what is already known? There are at least two reasons for this.

First, it is an alternative to an a-priori classification, which may lack a detailed description of the behavioural differences between vessels . Indeed, researchers have lamented the fact that the vessel type as reported by a vessel’s AIS is in many occasions too vague to be useful .

Second, it allows to verify the correctness of a vessel’s claimed properties. This can be achieved by comparing the observed behaviour with the expected behaviour for a vessel of a certain type. A substantial discrepancy between the two would indicate a possible inaccuracy in the data which are not uncommon . Revealing such discrepancies can be particularly useful within an anomaly detection setting. For instance, information about the veracity of AIS data can also serve as an indicator of a vessel’s trustworthiness . Such research has been carried out more extensively by using a combination of provenance and probabilistic logic.

Several approaches for classifying vessels exist. Common approaches make use of radar, infrared or overhead vessel imagery or using the acoustic radiated noise of a vessel . Vessel classification research using AIS data is less common . performed a case-study analysis of vessel-behaviour in the Port of Rotterdam area using AIS data concluding that vessels of different size navigate at a significantly different speed and along different paths. Similarly, also worked on AIS data of ships navigating in the Rotterdam area. The research is enlightening in showing how pairing AIS data with geographical domain knowledge[3] can significantly improve vessel classification accuracy. Such domain knowledge may include information about clearways, approaches or anchorages just to mention a few

[1] Such as fishing vessel, cargo vessel, etc.

[2] For reasons of maritime safety. Particularly vessels with gross tonnages of over 300 tons and passenger vessels.

[3] Sometimes also referred to as semantic trajectory mining .

