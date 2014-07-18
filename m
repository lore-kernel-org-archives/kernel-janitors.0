From: Julian Anastasov <ja@ssi.bg>
Date: Fri, 18 Jul 2014 20:48:07 +0000
Subject: Re: [PATCH 3/5] net/netfilter/ipvs/ip_vs_ctl.c: drop argument range check just before the check for 
Message-Id: <alpine.LFD.2.11.1407182339160.2273@ja.home.ssi.bg>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405697638-23767-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405697638-23767-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, lvs-devel@vger.kernel.org, netdev@vger.kernel.org, dcb314@hotmail.com, davem@davemloft.net, kadlec@blackhole.kfki.hu, kaber@trash.net, pablo@netfilter.org, horms@verge.net.au, wensong@linux-vs.org


	Hello,

On Fri, 18 Jul 2014, Andrey Utkin wrote:

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80601
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---
>  net/netfilter/ipvs/ip_vs_ctl.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ct=
l.c
> index 581a658..4ed7b59 100644
> --- a/net/netfilter/ipvs/ip_vs_ctl.c
> +++ b/net/netfilter/ipvs/ip_vs_ctl.c
> @@ -2338,8 +2338,6 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __u=
ser *user, unsigned int len)
> =20
>  	if (cmd < IP_VS_BASE_CTL || cmd > IP_VS_SO_SET_MAX)
>  		return -EINVAL;
> -	if (len < 0 || len >  MAX_ARG_LEN)
> -		return -EINVAL;

	The above check ensures the set_arglen[] value (some
struct size) does not exceed the arg[MAX_ARG_LEN] space. You can check
commit 04bcef2a83f40c ("ipvs: Add boundary check on ioctl arguments")
for more info. Still, check can be reduced to
if (len > MAX_ARG_LEN)... Also, len is unsigned, so len < 0 is
useless even for this reason.

>  	if (len !=3D set_arglen[SET_CMDID(cmd)]) {
>  		pr_err("set_ctl: len %u !=3D %u\n",
>  		       len, set_arglen[SET_CMDID(cmd)]);
> --=20
> 1.8.5.5

Regards

--
Julian Anastasov <ja@ssi.bg>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
