From: Felipe W Damasio <felipewd@terra.com.br>
Date: Tue, 02 Nov 2004 22:16:19 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <41880733.4060300@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64050733144732841=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org

--===============64050733144732841==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

	Carlo,

Carlo Perassi wrote:
>  static int fiber_autoneg(struct tg3 *tp, u32 *flags)
>  {
> -	int res = 0;
>  	struct tg3_fiber_aneginfo aninfo;
>  	int status = ANEG_FAILED;
> +	unsigned int res = 0;
>  	unsigned int tick;
>  	u32 tmp;

	pedantic comment: Shouldn't you change the function header to "static 
unsigned int", instead of forcing a cast back to int on return?

	Cheers,

Felipe

--===============64050733144732841==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64050733144732841==--
