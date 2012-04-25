From: Ingo Molnar <mingo@kernel.org>
Date: Wed, 25 Apr 2012 10:23:58 +0000
Subject: Re: [GIT PULL] L3 CID fix for 3.5
Message-Id: <20120425102357.GC20853@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120419070053.GB16645@elgon.mountain>
 <4F8FCA3A.5060504@linux.vnet.ibm.com>
 <20120419110229.GB30447@aftab>
 <20120419114453.GO6498@mwanda>
 <20120419165353.GF3221@aftab.osrc.amd.com>
 <20120425093001.GA18882@aftab.osrc.amd.com>
In-Reply-To: <20120425093001.GA18882@aftab.osrc.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>, Frank Arnold <frank.arnold@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Dan Carpenter <dan.carpenter@oracle.com>


* Borislav Petkov <borislav.petkov@amd.com> wrote:

> Ping?
> 
> Guys, any issues with this that I should know of?

Looks good to me. You marked it v3.5, should I pull it into 
v3.4? Looks small enough to me and we better keep such user 
facing interfaces correct, even if there's no direct regression.

Thanks,

	Ingo
