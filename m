From: Roland Dreier <rdreier@cisco.com>
Date: Thu, 08 Apr 2010 16:00:36 +0000
Subject: Re: [patch] infiniband: checking the wrong variable
Message-Id: <ada39z6x7bv.fsf@roland-alpha.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100407093901.GG5157@bicker>
	<g2ge2e108261004080313t32c2e1besd8a95e2f9bf418f9@mail.gmail.com>
	<ada7hoixaqw.fsf@roland-alpha.cisco.com>
	<r2le2e108261004080807i36ad0755gad9843224b0c42fc@mail.gmail.com>
In-Reply-To: <r2le2e108261004080807i36ad0755gad9843224b0c42fc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Bart Van Assche's message of "Thu, 8 Apr 2010 17:07:02 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bvanassche-HInyCGIudOg@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jack Morgenstein <jackm-LDSdmyG8hGV8YrgS2mwiifqBs+8SCbDb@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

 > It would be great if someone could explain the impact of this issue --
 > the impact is not yet clear to me.

Um, it's a one-line patch -- pretty clear if the allocation fails then
we check the wrong value and probably crash.
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
