From: Ike Panhc <ike.pan@canonical.com>
Date: Thu, 28 Jun 2012 09:52:32 +0000
Subject: Re: [patch] ideapad: uninitialized data in ideapad_acpi_add()
Message-Id: <4FEC2960.3010300@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120612162850.GB11077@elgon.mountain> <4FE1C0B1.9050901@canonical.com> <20120622135746.GG5390@mwanda>
In-Reply-To: <20120622135746.GG5390@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/22/2012 09:57 PM, Dan Carpenter wrote:
> On Wed, Jun 20, 2012 at 08:23:13PM +0800, Ike Panhc wrote:
>> Hi Dan,
>>
>> # cat /sys/kernel/debug/ideapad/cfg
>> cfg: 0xFFFF8800007DE140
>>        ^^^^^^^^ the uninitialized bit
>>
>> I see your point, perhaps unsigned int will be better then int?
>>
> 
> I don't know if this is a question or a resend request.
> 
> I just chose that base on the fact that we are reading an int from
> ACPI in read_method_int(adevice->handle, "_CFG", &cfg).  Either way
> we're going to run into integer conversion issues if we get passed
> a large or negative int.
> 
> I can resend if you want, I don't have strong feelings on this.
> 
> regards,
> dan carpenter
> 

ah, I asked stupid question. Never mind.

Thanks for your report.
