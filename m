From: Domen Puncer <domen@coderock.org>
Date: Fri, 18 Mar 2005 10:37:19 +0000
Subject: Re: [KJ] linux-2.6.11: fix psmouse-base.c error messages
Message-Id: <20050318103719.GB4006@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12760164046013944=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <422B3892.6080301@bfs.de>
In-Reply-To: <422B3892.6080301@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============12760164046013944==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 06/03/05 18:06 +0100, walter harms wrote:
> Hi list,
> this is a resend of the older patch now against 2.6.11.

Still doesn't seem ok.
patch: **** malformed patch at line 83: throwing %d bytes away.\n",

Could you first mail patch to yourself, and try to apply it?


	Domen

--===============12760164046013944==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12760164046013944==--
