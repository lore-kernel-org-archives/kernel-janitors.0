From: Alan Cox <alan@linux.intel.com>
Date: Wed, 13 Oct 2010 09:20:17 +0000
Subject: Re: [PATCH] staging: intel_sst: use signed int for error codes
Message-Id: <20101013102017.7d60090c@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286731724-17996-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1286731724-17996-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Harsha Priya <priya.harsha@intel.com>, Vinod Koul <vinod.koul@intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, 10 Oct 2010 21:28:43 +0400
Vasiliy Kulikov <segooon@gmail.com> wrote:

> As retval stores error code, it should be signed int.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Alan Cox <alan@linux.intel.com>
