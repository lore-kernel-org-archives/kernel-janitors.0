From: David Gibson <hermes@gibson.dropbear.id.au>
Date: Tue, 28 Sep 2004 00:40:12 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 26/38] net/orinoco_plx:
Message-Id: <20040928004012.GC8889@zax>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17792074327854879=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============17792074327854879==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 23, 2004 at 03:01:10PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use ssleep() instead of schedule_timeout()
> to guarantee the task delays as expected.

This change (well, almost, using mdelay() rather than ssleep()) is
already in the working CVS tree.  I already realise we're long, long
overdue on merging upstream.

-- 
David Gibson			| For every complex problem there is a
david AT gibson.dropbear.id.au	| solution which is simple, neat and
				| wrong.
http://www.ozlabs.org/people/dgibson

--===============17792074327854879==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17792074327854879==--
