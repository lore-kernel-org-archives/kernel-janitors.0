From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Thu, 13 Sep 2018 22:59:53 +0000
Subject: Re: [Xen-devel] [PATCH] xen: fix GCC warning and remove duplicate EVTCHN_ROW/EVTCHN_COL usage
Message-Id: <7e11300b-e590-4beb-28e7-bfc8bff73334@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180913011354.GA19226@josh-ThinkPad-T460s>
 <37107f15-119b-118e-cbd3-1bb87356e442@suse.com>
In-Reply-To: <37107f15-119b-118e-cbd3-1bb87356e442@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Juergen Gross <jgross@suse.com>, Josh Abraham <j.abraham1776@gmail.com>
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, aams@amazon.com, linux-kernel@vger.kernel.org, roger.pau@citrix.com

On 9/13/18 1:13 AM, Juergen Gross wrote:
> On 13/09/18 03:13, Josh Abraham wrote:
>> This patch removes duplicate macro useage in events_base.c.
>>
>> It also fixes gcc warning:
>> variable ‘col’ set but not used [-Wunused-but-set-variable]
>>
>> Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Applied to for-linux-4.19b.

-boris
