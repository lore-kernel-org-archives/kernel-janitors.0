From: bert hubert <bert.hubert@netherlabs.nl>
Date: Fri, 21 Apr 2006 07:41:30 +0000
Subject: [KJ] Re: [PATCH] Extending getrusage
Message-Id: <20060421074129.GA31972@outpost.ds9a.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77053705354440138=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <d0191dad0604200821l3fa0ed70ga2faabe79d7718ec@mail.gmail.com> <20060420162140.0a03e227.akpm@osdl.org>
In-Reply-To: <20060420162140.0a03e227.akpm@osdl.org>
To: Andrew Morton <akpm@osdl.org>
Cc: Claudio Scordino <cloud.of.andor@gmail.com>, linux-kernel@vger.kernel.org, luto@myrealbox.com, kernel-janitors@lists.osdl.org

--===============77053705354440138==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 20, 2006 at 04:21:40PM -0700, Andrew Morton wrote:
> I'd be reluctant to support this change without a compelling description of
> why we actually want it.

It offers nothing that isn't available elsewhere (I think), except more
cheaply. It also has the potential to be multiplatform one day. Right now to
get the CPU usage of a random pid, one has to implement the equivalent of
/proc/ parsing for each platform.

If at least Linux did 'getrusage for foreign pid', that would clean up
things up somewhat already.

It might even mean a 'portable top', and who knows, more unixes might
follow.

I for one would save work having a getrusage that does this.

	Bert

-- 
http://www.PowerDNS.com      Open source, database driven DNS Software 
http://netherlabs.nl              Open and Closed source services

--===============77053705354440138==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77053705354440138==--
