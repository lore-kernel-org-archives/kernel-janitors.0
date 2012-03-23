From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Fri, 23 Mar 2012 15:42:19 +0000
Subject: Re: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <CAOD=uF4xGy587CPwznsyGFvEvKzCMmaMBzW4VYk0JKQEaA8JRA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323095158.GB3181@mwanda>
In-Reply-To: <20120323095158.GB3181@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2012 at 8:26 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Mar 23, 2012 at 03:11:45PM +0530, santosh nayak wrote:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> Replace kmalloc+memset pair by kzalloc() in 'wl_wds_device_alloc()'.
>> Add error handling to avoid null derefernce.
>>
>> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
>> ---
>> =A0drivers/staging/wlags49_h2/wl_netdev.c | =A0 =A08 ++++++--
>> =A01 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/wlags49_h2/wl_netdev.c b/drivers/staging/wl=
ags49_h2/wl_netdev.c
>> index 9c16f54..426ba04 100644
>> --- a/drivers/staging/wlags49_h2/wl_netdev.c
>> +++ b/drivers/staging/wlags49_h2/wl_netdev.c
>> @@ -1511,8 +1511,12 @@ void wl_wds_device_alloc( struct wl_private *lp )
>> =A0 =A0 =A0for( count =3D 0; count < NUM_WDS_PORTS; count++ ) {
>> =A0 =A0 =A0 =A0 =A0struct net_device *dev_wds =3D NULL;
>>
>> - =A0 =A0 =A0 =A0dev_wds =3D kmalloc( sizeof( struct net_device ), GFP_K=
ERNEL );
>> - =A0 =A0 =A0 =A0memset( dev_wds, 0, sizeof( struct net_device ));
>> + =A0 =A0 dev_wds =3D kzalloc(sizeof(struct net_device), GFP_KERNEL);
>> + =A0 =A0 if (unlikely(!dev_wds)) {
>
> NEVER use unlikely unless you are working on scheduler code, or
> something else equally time critical. =A0So, take this into consideration,
> and Dan's comments, and please redo this, I can't take it as-is.
>

Greg,

I will include your suggestion and resend it.

Can you please explain whats the disadvantage of having 'unlikely()' here ?
I have seen it at several places in driver side.

regards
Santosh

> thanks,
>
> greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
