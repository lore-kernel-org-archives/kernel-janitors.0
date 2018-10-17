From: David Arcari <darcari@redhat.com>
Date: Wed, 17 Oct 2018 14:04:54 +0000
Subject: Re: [Intel-wired-lan] [PATCH] ice: remove an unneeded NULL check
Message-Id: <3e42b278-b46c-6d9b-ae0e-68d65657a8af@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <804857E1F29AAC47BF68C404FC60A184F24B35A4@FMSMSX151.amr.corp.intel.com>
In-Reply-To: <804857E1F29AAC47BF68C404FC60A184F24B35A4@FMSMSX151.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/16/2018 06:59 AM, Dan Carpenter wrote:
> On Mon, Oct 15, 2018 at 04:18:35PM +0000, Allan, Bruce W wrote:
>>> -----Original Message-----
>>> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On Behalf
>>> Of Dan Carpenter
>>> Sent: Friday, October 12, 2018 12:17 AM
>>> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; Ertman, David M
>>> <david.m.ertman@intel.com>
>>> Cc: kernel-janitors@vger.kernel.org; intel-wired-lan@lists.osuosl.org
>>> Subject: [Intel-wired-lan] [PATCH] ice: remove an unneeded NULL check
>>>
>>> We added a NULL check in commit 072f0c3db9da ("ice: Fix potential null
>>> pointer issues") but it causes static checker warnings.
>>
>> Which static checker and with what options?
>>
> 
> Future versions of Smatch will complain probably.  It turns out there
> are many many unnecessary NULL checks and they seldome indicate a bug so
> I'm waffling on this...

I don't see how fi could ever be NULL.  It's set to the address of
fm_entry->fltr_info.

Given that, it really seems like the check should go, since it is clearly
unnecessary.

-Dave

> 
> regards,
> dan carpenter
> 
> _______________________________________________
> Intel-wired-lan mailing list
> Intel-wired-lan@osuosl.org
> https://lists.osuosl.org/mailman/listinfo/intel-wired-lan
> 
