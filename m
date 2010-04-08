From: Roland Dreier <rdreier@cisco.com>
Date: Thu, 08 Apr 2010 14:46:47 +0000
Subject: Re: [patch] infiniband: checking the wrong variable
Message-Id: <ada7hoixaqw.fsf@roland-alpha.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100407093901.GG5157@bicker>
	<g2ge2e108261004080313t32c2e1besd8a95e2f9bf418f9@mail.gmail.com>
In-Reply-To: <g2ge2e108261004080313t32c2e1besd8a95e2f9bf418f9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Bart Van Assche's message of "Thu, 8 Apr 2010 12:13:42 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bvanassche-HInyCGIudOg@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jack Morgenstein <jackm-LDSdmyG8hGV8YrgS2mwiifqBs+8SCbDb@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

 > Have you already had the time to check whether this fix should be
 > backported to already released kernels, and if so, to which kernel
 > versions ? The easiest way to ask for backporting is to add "Cc:
 > <stable@kernel.org>" in a patch.

It backports but I don't see it as fixing a big enough problem to be
worth it for stable.
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
