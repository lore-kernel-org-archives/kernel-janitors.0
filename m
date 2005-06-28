From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 28 Jun 2005 03:40:36 +0000
Subject: Re: [KJ] [PATCH] fs/reiserfs/journal.c: replace direct assignment
Message-Id: <20050628034036.GA4169@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============024976599288728085=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200506272059.13667.victor@cetuc.puc-rio.br>
In-Reply-To: <200506272059.13667.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============024976599288728085==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27.06.2005 [20:59:13 +0000], Victor Fusco wrote:
> description:
> Use set_current_state() instead of direct assignment of
> current->state.

The memory barrier in set_current_state() (as opposed to
__set_current_state()) is not necessary for putting the state back to
RUNNING.

Thanks,
Nish

--===============024976599288728085==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============024976599288728085==--
