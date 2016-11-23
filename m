From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Nov 2016 22:42:00 +0000
Subject: [bug report] mlxsw: core: Implement thermal zone
Message-Id: <20161123224200.GA31108@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ivan Vecera,

The patch a50c1e35650b: "mlxsw: core: Implement thermal zone" from
Nov 22, 2016, leads to the following static checker warning:

	drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:261 mlxsw_thermal_set_trip_temp()
	warn: no lower bound on 'temp'

drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
   252  static int mlxsw_thermal_set_trip_temp(struct thermal_zone_device *tzdev,
   253                                         int trip, int temp)
   254  {
   255          struct mlxsw_thermal *thermal = tzdev->devdata;
   256  
   257          if (trip < 0 || trip >= MLXSW_THERMAL_NUM_TRIPS ||
   258              temp > MLXSW_THERMAL_MAX_TEMP)
   259                  return -EINVAL;
   260  
   261          thermal->trips[trip].temp = temp;

Did you allow negative numbers intentionally?  It feels like there
should be some kind of min temp.

   262          return 0;
   263  }
   264  

regards,
dan carpenter
