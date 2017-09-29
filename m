From: Doug Ledford <dledford@redhat.com>
Date: Fri, 29 Sep 2017 15:27:15 +0000
Subject: Re: [PATCH][rdma-next] RDMA/hns: make various function static, fixes warnings
Message-Id: <1506698835.2919.20.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170929131601.7111-1-colin.king@canonical.com>
In-Reply-To: <20170929131601.7111-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Lijun Ou <oulijun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Wei Hu <xavier.huwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, 2017-09-29 at 14:16 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions hns_roce_table_mhop_get, hns_roce_table_mhop_put,
> hns_roce_cleanup_mhop_hem_table,  hns_roce_v1_post_mbox,
> hns_roce_cmq_setup_basic_desc, hns_roce_cmq_send,
> hns_roce_cmq_query_hw_info are all local to the source and do
> not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> symbol 'hns_roce_table_mhop_get' was not declared. Should it be
> static?
> symbol 'hns_roce_table_mhop_put' was not declared. Should it be
> static?
> symbol 'hns_roce_cleanup_mhop_hem_table' was not declared. Should it
> be
> static?
> symbol 'hns_roce_v1_post_mbox' was not declared. Should it be static?
> symbol 'hns_roce_cmq_setup_basic_desc' was not declared. Should it be
> static?
> symbol 'hns_roce_cmq_send' was not declared. Should it be static?
> symbol 'hns_roce_cmq_query_hw_info' was not declared. Should it be
> static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

