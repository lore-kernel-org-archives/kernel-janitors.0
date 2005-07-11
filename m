From: Domen Puncer <domen@coderock.org>
Date: Mon, 11 Jul 2005 13:01:47 +0000
Subject: Re: [KJ] [PATCH] toshiba_acpi check kmalloc return value
Message-Id: <20050711130147.GA2448@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96481155015785014=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1121044844.3554.25.camel@localhost>
In-Reply-To: <1121044844.3554.25.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============96481155015785014==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/07/05 11:53 +0200, walter harms wrote:
> tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
> if (!tmp_buffer)
> 	return -ENOMEM;
> 
> if ( copy_from_user(tmp_buffer, buffer, count) )
> 	result = -EFAULT;
> 
> tmp_buffer[count] = 0;
> result = item->write_func(tmp_buffer, count);
> 
> 
> just for the paranoid:
>  should tmp_buffer be filled with \0 to avoid an information leak ?
>  (schroedinger bug ?)

We copy _from_ userspace.

--===============96481155015785014==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96481155015785014==--
