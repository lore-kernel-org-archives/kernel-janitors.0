From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Sun, 26 Feb 2006 19:52:27 +0000
Subject: Re: [KJ] [PATCH] check request_region return value
Message-Id: <200602262052.27818.tim@aapopfiets.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97645224709679002=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602242249.22568.tim@aapopfiets.nl>
In-Reply-To: <200602242249.22568.tim@aapopfiets.nl>
To: kernel-janitors@vger.kernel.org

--===============97645224709679002==
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 26 February 2006 05:50, Darren Jenkins\ wrote:
> This might sound a bit stupid, but why are you doing release_region
> here ? As you can't warn the upstream code, it will presumably try to
> use the regions anyway. Wouldn't it be better to just to warn on a
> failure, and keep going as normal? leaving all the regions (that were
> acquired) mapped, keeping breakage/(usage of unmapped regions) to a
> minimum?
Good point.  I'll revise my patch and resubmit.

Tim

--===============97645224709679002==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97645224709679002==--
