From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Dec 2018 10:14:02 +0000
Subject: Re: [PATCH] remoteproc: fix a.vs ~ typo
Message-Id: <20181220101402.GQ19692@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218081657.GA32567@kadam>
 <5ed56497-be6f-f4e2-642d-47e2b0f45f42@st.com>
In-Reply-To: <5ed56497-be6f-f4e2-642d-47e2b0f45f42@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Loic PALLARDY <loic.pallardy@st.com>

On Thu, Dec 20, 2018 at 10:05:55AM +0000, Patrice CHOTARD wrote:
> > -	writel(!SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
> > +	writel((unsigned int)~SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
> >  
> >  	val = readl(slim_rproc->slimcore + SLIM_EN_OFST);
> >  	if (val & SLIM_EN_RUN)
> > 
> 
> Writing !SLIM_CLK_GATE_DIS or (unsigned int)~SLIM_CLK_GATE_DIS don't
> give the same result:
> 
> !SLIM_CLK_GATE_DIS = 0
> 
> (unsigned int)~SLIM_CLK_GATE_DIS = 0xfffffffe

Right.  !BIT(0) is zero.  I'm pretty sure we meant to do a bitwise
negate and not a logical negate from looking at the code, but I don't
know the real world impact and can't test it.  It's kind of a crap
patch, but I think it's correct.

regards,
dan carpenter
