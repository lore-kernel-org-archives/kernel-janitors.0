From: ebiederm@xmission.com (Eric W. Biederman)
Date: Sun, 02 Sep 2012 02:36:10 +0000
Subject: Re: [userns:userns-always-map-user-v52 38/154] fs/quota/quota.c:246: undefined reference to `qid_val
Message-Id: <87bohp882t.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120902022057.GA14240@localhost>
In-Reply-To: <20120902022057.GA14240@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Eric,
>
> FYI, kernel build failed on

Thanks.  

It looks like I misread the kconfig dependencies. 

kqid. should have depended on QUOTACTL not QUOTA.  Sigh.

Eric
