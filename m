From: Zach Brown <zab@zabbo.net>
Date: Mon, 29 Mar 2004 03:39:53 +0000
Subject: Re: [Kernel-janitors] old patches never die?
Message-Id: <40679A89.1020000@zabbo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040329014927.38963.qmail@web60501.mail.yahoo.com>
In-Reply-To: <20040329014927.38963.qmail@web60501.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



> -	for_each_pgdat(pgdat)
> -		kernel_thread(kswapd, pgdat, CLONE_KERNEL);
> +	for_each_pgdat(pgdat) {
> +		ret = kernel_thread(kswapd, pgdat, CLONE_KERNEL);
> +		if (ret < 0)
> +			panic("%s: unable to initialise kswapd\n", __FUNCTION__);
> +	}

If we're going to the trouble of storing 'ret' instead of just checking
the return of kernel_thread(), it sure would be nice to include it in
the panic() output.

- z

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
