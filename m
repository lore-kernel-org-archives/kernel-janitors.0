From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 04 Mar 2005 01:05:47 +0000
Subject: [KJ] Re: [RFC][PATCH 1/5] add poll_event*()
Message-Id: <20050304010547.GF16078@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66194144081382911=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66194144081382911==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 10:22:38AM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Description: Add the poll_event(), poll_event_timeout(),
> poll_event_interruptible() and poll_event_interruptible_timeout()
> interfaces. These macros encapsulate typical sleeping code usage in a
> sane way.

Macros broken in some subtle & not-so-subtle ways. I will try and get a
cleaned-up new version for everyone to examine by tomorrow.

Thanks!
Nish

--===============66194144081382911==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66194144081382911==--
