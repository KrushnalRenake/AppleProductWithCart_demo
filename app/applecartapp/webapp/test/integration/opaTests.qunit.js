sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'applecartapp/test/integration/FirstJourney',
		'applecartapp/test/integration/pages/AppleProductsList',
		'applecartapp/test/integration/pages/AppleProductsObjectPage'
    ],
    function(JourneyRunner, opaJourney, AppleProductsList, AppleProductsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('applecartapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheAppleProductsList: AppleProductsList,
					onTheAppleProductsObjectPage: AppleProductsObjectPage
                }
            },
            opaJourney.run
        );
    }
);