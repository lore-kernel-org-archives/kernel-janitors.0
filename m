From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 24 Apr 2018 12:55:05 +0000
Subject: Re: [PATCH] mlxsw: spectrum_switchdev: remove duplicated check on multicast_enable
Message-Id: <595cc615-0802-d444-a4ad-d6a67d546cc4@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424115139.21134-1-colin.king@canonical.com>
 <20180424125104.GA2461@splinter.mtl.com>
In-Reply-To: <20180424125104.GA2461@splinter.mtl.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ido Schimmel <idosch@idosch.org>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, nogahf@mellanox.com

On 24/04/18 13:51, Ido Schimmel wrote:
> On Tue, Apr 24, 2018 at 12:51:39PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check on bridge_port->bridge_device->multicast_enable is performed
>> twice in two nested if statements. I can't see any reason for this, the
>> second check is redundant and can be removed.
>>
>> Detected by cppcheck:
>> drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:1722]:
>> (warning) Identical inner 'if' condition is always true.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
>> index c11c9a635866..989ed19e25c9 100644
>> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
>> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
>> @@ -1719,12 +1719,9 @@ __mlxsw_sp_port_mdb_del(struct mlxsw_sp_port *mlxsw_sp_port,
>>  	int err;
>>  
>>  	if (bridge_port->bridge_device->multicast_enabled) {
>> -		if (bridge_port->bridge_device->multicast_enabled) {
> 
> This looks like a copy-paste error. I believe the intention was to check
> '!bridge_port->mrouter' so that if port is an mrouter port packets
> hitting the MDB entry would still be sent to it even after it was
> removed from the MDB entry ports list.

Ah, that makes a lot more sense.

> 
> I will send a patch later this week after I run it by Nogah who worked
> on this part.

OK, thanks!
> 
> Thanks for the patch.
> 
>> -			err = mlxsw_sp_port_smid_set(mlxsw_sp_port, mid->mid,
>> -						     false);
>> -			if (err)
>> -				netdev_err(dev, "Unable to remove port from SMID\n");
>> -		}
>> +		err = mlxsw_sp_port_smid_set(mlxsw_sp_port, mid->mid, false);
>> +		if (err)
>> +			netdev_err(dev, "Unable to remove port from SMID\n");
>>  	}
>>  
>>  	err = mlxsw_sp_port_remove_from_mid(mlxsw_sp_port, mid);
>> -- 
>> 2.17.0
>>

