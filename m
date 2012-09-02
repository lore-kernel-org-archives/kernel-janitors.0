From: ebiederm@xmission.com (Eric W. Biederman)
Date: Sun, 02 Sep 2012 03:18:07 +0000
Subject: Re: [userns:userns-always-map-user-v52 38/154] fs/quota/quota.c:246: undefined reference to `qid_val
Message-Id: <87627x864w.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120902022057.GA14240@localhost>
In-Reply-To: <20120902022057.GA14240@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> On Sat, Sep 01, 2012 at 07:36:10PM -0700, Eric W. Biederman wrote:
>> Fengguang Wu <fengguang.wu@intel.com> writes:
>> 
>> > Hi Eric,
>> >
>> > FYI, kernel build failed on
>> 
>> Thanks.  
>> 
>> It looks like I misread the kconfig dependencies. 
>> 
>> kqid. should have depended on QUOTACTL not QUOTA.  Sigh.
>
> OK. This commit also triggers another error:
>
> N: make[3]: *** No rule to make target `fs/quota/kqid.o', needed by
> `fs/quota/built-in.o'.

Yeah.  I forgot to git add fs/quota/kqid.c

It looks like I was a bit too tired when I pushed up this change.

Again, thanks for catching this.

Eric

