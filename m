From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Fri, 10 Jul 2020 15:40:53 +0000
Subject: Re: [PATCH] xen/xenbus: Fix a double free in xenbus_map_ring_pv()
Message-Id: <0c55ff06-4129-4e25-449a-2b310eca39ba@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200710113610.GA92345@mwanda>
 <3434e219-216f-ba50-c001-35a066d20db4@suse.com>
In-Reply-To: <3434e219-216f-ba50-c001-35a066d20db4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yan Yankovskyi <yyankovskyi@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org

On 7/10/20 8:15 AM, Jürgen Groß wrote:
> On 10.07.20 13:36, Dan Carpenter wrote:
>> When there is an error the caller frees "info->node" so the free here
>> will result in a double free.  We should just delete first kfree().
>>
>> Fixes: 3848e4e0a32a ("xen/xenbus: avoid large structs and arrays on
>> the stack")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Thanks for spotting this!
>
> Reviewed-by: Juergen Gross <jgross@suse.com> 


Applied to for-linus-5.8b


-boris
