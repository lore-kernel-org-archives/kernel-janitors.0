From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Date: Mon, 11 Nov 2019 13:17:57 +0000
Subject: Re: [PATCH][next] xen/gntdev: remove redundant non-zero check on ret
Message-Id: <767fe18a-c3d6-4200-9eb5-31e1665811a0@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111122009.67789-1-colin.king@canonical.com>
 <04efe197-2914-ab1d-918b-8899aa0354af@suse.com>
 <ec4ffabf-9cfa-2db6-7e23-60f84947d0a9@canonical.com>
In-Reply-To: <ec4ffabf-9cfa-2db6-7e23-60f84947d0a9@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin Ian King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11.11.19 13:31, Colin Ian King wrote:
> On 11/11/2019 12:25, Jürgen Groß wrote:
>> On 11.11.19 13:20, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The non-zero check on ret is always going to be false because
>>> ret was initialized as zero and the only place it is set to
>>> non-zero contains a return path before the non-zero check. Hence
>>> the check is redundant and can be removed.
>>
>> Which version did you patch against? In current master the above
>> statement is not true.
> 
> against today's linux-next

Ah, okay, this is likely the result of the recent mm-notifier patch
series. I'll put this patch on hold until the recent patches have
hit master.


Juergen
