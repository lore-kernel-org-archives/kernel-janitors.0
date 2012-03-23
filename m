From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Fri, 23 Mar 2012 09:58:18 +0000
Subject: Re: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <CAOD=uF5VerJPXXVnLBK0DEtXAVfcNwx172NmPFsFx4PVSWaN-Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323095158.GB3181@mwanda>
In-Reply-To: <20120323095158.GB3181@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2012 at 3:21 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> On Fri, Mar 23, 2012 at 03:11:45PM +0530, santosh nayak wrote:
>> - =A0 =A0 =A0 =A0dev_wds =3D kmalloc( sizeof( struct net_device ), GFP_K=
ERNEL );
>> - =A0 =A0 =A0 =A0memset( dev_wds, 0, sizeof( struct net_device ));
>> + =A0 =A0 dev_wds =3D kzalloc(sizeof(struct net_device), GFP_KERNEL);
>> + =A0 =A0 if (unlikely(!dev_wds)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: failed to alloc memory\n"=
, __func__);
>
> Don't resend, but kmalloc() already prints out way more extensive
> and useful error messages than this. =A0No need to print an error
> message yourself normally.
>

Do you mean in the following format ?

+       if (unlikely(!dev_wds)) {
+               DBG_LEAVE(DbgInfo);
+               return;
+       }



regards
Santosh
> regards,
> dan carpenter
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
