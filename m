From: Domen Puncer <domen@coderock.org>
Date: Tue, 04 Jan 2005 22:47:29 +0000
Subject: [KJ] Re: isdn_bsdcomp.c - vfree() checking cleanups
Message-Id: <20050104224729.GB3496@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4597925222367123=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4597925222367123==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 04/01/05 13:56 -0800, jlamanna@gmail.com wrote:
> -		if (db->dict) {
> -			vfree (db->dict);
> -			db->dict -		}
> +		vfree (db->dict);
> +		db->dict  

Khm... mailer problems with '='?
Please fix this (encoding settings?) and resend.
Also: you can test your mail is fine by sending it to youself and
feeding it to `patch`.

Other than this, patches look fine to me.


	Domen

--===============4597925222367123==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4597925222367123==--
