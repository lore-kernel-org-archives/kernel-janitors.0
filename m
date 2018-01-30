From: Ross Zwisler <ross.zwisler@linux.intel.com>
Date: Tue, 30 Jan 2018 23:50:18 +0000
Subject: Re: [PATCH] libnvdimm, namespace: remove redundant initialization of 'nd_mapping'
Message-Id: <20180130235018.GE23836@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180130174707.4921-1-colin.king@canonical.com>
In-Reply-To: <20180130174707.4921-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org

On Tue, Jan 30, 2018 at 05:47:07PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer nd_mapping is being initialized to a value that is never read,
> instead it is being updated to a new value in all the cases where it
> is being read afterwards, hence the initialization is redundant and
> can be removed.
> 
> Cleans up clang warning:
> drivers/nvdimm/namespace_devs.c:2411:21: warning: Value stored to
> 'nd_mapping' during its initialization is never rea
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Sure, this looks good.  Thanks.

Reviewed-by: Ross Zwisler <ross.zwisler@linux.intel.com>
