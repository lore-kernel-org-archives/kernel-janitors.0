From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Tue, 01 Mar 2005 21:31:39 +0000
Subject: [KJ] Re: [NFS] [PATCH 7/40] fs/nfs4callback: replace
Message-Id: <20050301213139.GA1985@fieldses.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14254075398780786=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120190352.GH5393@us.ibm.com>
In-Reply-To: <20050120190352.GH5393@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: kernel-janitors@lists.osdl.org, nfs@lists.sourceforge.net, neilb@cse.unsw.edu.au

--===============14254075398780786==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 11:03:52AM -0800, Nishanth Aravamudan wrote:
> Please consider applying.
> 
> Description: Use ssleep() instead of schedule_timeout() to guarantee the task
> delays as expected.

Thanks, but a different fix for this has been submitted.  (Our sleeping
at all there is a bug.)--b.

--===============14254075398780786==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14254075398780786==--
