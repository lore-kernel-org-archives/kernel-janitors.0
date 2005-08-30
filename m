From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 30 Aug 2005 19:32:10 +0000
Subject: [KJ] audit return codes of copy_*_user() patches
Message-Id: <20050830193210.GA32288@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28708824095773866=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28708824095773866==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From return_code-drivers_ide.patch

> [KJ] [PATCH][RESUBMIT][4/21] drivers/ide/* - compile warning cleanup

> compile warning cleanup - handle copy_to/from_user error returns

> --- quilt.orig/drivers/ide/ide-tape.c
> +++ quilt/drivers/ide/ide-tape.c
> @@ -2656,7 +2656,13 @@ static void idetape_copy_stage_from_user
>  		}
>  #endif /* IDETAPE_DEBUG_BUGS */
>  		count = min((unsigned int)(bh->b_size - atomic_read(&bh->b_count)), (unsigned int)n);
> -		copy_from_user(bh->b_data + atomic_read(&bh->b_count), buf, count);
> +		if (copy_from_user(bh->b_data + atomic_read(&bh->b_count), buf, count)) {
> +#if IDETAPE_DEBUG_BUGS
> +			printk(KERN_ERR "ide-tape/%s: copy_from_user failed!\n",
> +					__FUNCTION__);
> +#endif /* IDETAPE_DEBUG_BUGS */
> +			return;
> +		}
>  		n -= count;
>  		atomic_add(count, &bh->b_count);
>  		buf += count;

This is likely wrong. IMO it should be

			...
		retval = copy_from_user( , , count);
		n -= retval;
		atomic_add(retval, );
		buf += retval;
			...

similar to drivers/char/n_tty.c. Ditto for other chunk. Ditto for
	return_code-drivers_isdn_hisax.patch
	return_code-drivers_isdn_pcbit.patch


--===============28708824095773866==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28708824095773866==--
