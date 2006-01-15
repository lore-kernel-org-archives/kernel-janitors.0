From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 15 Jan 2006 22:30:35 +0000
Subject: Re: [KJ] Audit return codes (and handle failure correctly) for
Message-Id: <20060115223035.GB19795@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37480279279852713=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9a09df00601150731g4d65ab40ya62134fbd0a8cb22@mail.gmail.com>
In-Reply-To: <d9a09df00601150731g4d65ab40ya62134fbd0a8cb22@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============37480279279852713==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 15, 2006 at 05:31:05PM +0200, Udayan Singh wrote:
> I am trying to understand a point mentioned in ToDo list of KJ,
>
> "Audit return codes (and handle failure correctly) for  " -- create_proc_*()
> ..
>
> I had a look at the code (in fs/proc/*, linux kernel 2.6.14).
>
> Clarifications that i needed :
>
> Is it that the wherever create_proc_* functions are being called, it needs
> to be looked into how is it handling a failure ?
> OR
> Within the function(s) create_proc_*, it needs to be looked into for the
> error codes it is receiving while it is calling other functions and handle
> them accordingly ?

The former. If function can fail its return code should be checked,
except very rare cases where you can't do anything better than panic().

> I intend to understand the above mentioned requirement and then try to do
> it. Would appreciate information on above.

Be sure to grab latest kernel (2.6.16-rc1 should be out pretty soon) and
look at latest -kj for things already done.


--===============37480279279852713==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37480279279852713==--
