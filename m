From: Richard Cochran <richardcochran@gmail.com>
Date: Wed, 01 Jan 2020 15:43:54 +0000
Subject: Re: [PATCH 13/16] ptp: ptp_clockmatrix: constify copied structure
Message-Id: <20200101154354.GA1524@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
 <1577864614-5543-14-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-14-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 01, 2020 at 08:43:31AM +0100, Julia Lawall wrote:
> The idtcm_caps structure is only copied into another structure,
> so make it const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Richard Cochran <richardcochran@gmail.com>
