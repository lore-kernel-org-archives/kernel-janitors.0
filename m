From: Juergen Gross <jgross@suse.com>
Date: Thu, 13 Sep 2018 05:13:46 +0000
Subject: Re: [PATCH] xen: fix GCC warning and remove duplicate EVTCHN_ROW/EVTCHN_COL usage
Message-Id: <37107f15-119b-118e-cbd3-1bb87356e442@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180913011354.GA19226@josh-ThinkPad-T460s>
In-Reply-To: <20180913011354.GA19226@josh-ThinkPad-T460s>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Josh Abraham <j.abraham1776@gmail.com>, boris.ostrovsky@oracle.com
Cc: aams@amazon.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 13/09/18 03:13, Josh Abraham wrote:
> This patch removes duplicate macro useage in events_base.c.
> 
> It also fixes gcc warning:
> variable ‘col’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
