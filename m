From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:15:23 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/6] serial/68328serial:
Message-Id: <20040927211522.GB1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77541948690135354=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============77541948690135354==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 27, 2004 at 02:12:57PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected.

Sorry, I was missing part of the description. The patch also uses
set_current_state() instead of direct assignment of current->state.

-Nish

--===============77541948690135354==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77541948690135354==--
