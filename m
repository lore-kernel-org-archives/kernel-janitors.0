From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Fri, 23 Sep 2011 07:04:15 +0000
Subject: Re: [patch] agp: potential info leak in compat_agpioc_info_wrap()
Message-Id: <1316761455.2560.15.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923061945.GC4387@elgon.mountain>
In-Reply-To: <20110923061945.GC4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le vendredi 23 septembre 2011 à 09:19 +0300, Dan Carpenter a écrit :
> Smatch has a new check for Rosenberg type information leaks where
> structs are copied to the user with uninitialized stack data in them.
> 

Hmm, automatic tools should not send patches without human check.

> The agp_info32 struct has a 4 byte hole in it so we need to clear
> that before copying it to userspace.
> 
> struct agp_info32 {
>         struct agp_version         version;              /*     0     0 */
> 
>         /* XXX 4 bytes hole, try to pack */
> 

This makes no sense :

Why should we have a 32bit hole before an u32 field ?

Which arch mandates this ?

>         u32                        bridge_id;            /*     4     4 */
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/char/agp/compat_ioctl.c b/drivers/char/agp/compat_ioctl.c
> index a48e05b..0509497 100644
> --- a/drivers/char/agp/compat_ioctl.c
> +++ b/drivers/char/agp/compat_ioctl.c
> @@ -42,6 +42,8 @@ static int compat_agpioc_info_wrap(struct agp_file_private *priv, void __user *a
>  
>  	agp_copy_info(agp_bridge, &kerninfo);
>  
> +	memset(&userinfo, 0, sizeof(userinfo));
> +
>  	userinfo.version.major = kerninfo.version.major;
>  	userinfo.version.minor = kerninfo.version.minor;
>  	userinfo.bridge_id = kerninfo.device->vendor |


