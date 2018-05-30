From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 May 2018 19:21:19 +0000
Subject: Re: [PATCH][next] mailbox: PCC: check for negative count for parse failure checking
Message-Id: <20180530192119.eexpge4nke4uovlz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530171429.3172-1-colin.king@canonical.com>
In-Reply-To: <20180530171429.3172-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Al Stone <ahs3@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 30, 2018 at 06:14:29PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function acpi_table_parse_enties_array can potentially return a
> negative value if parsing fails. Currently the check on the return
> is not checking for errors, so fix this by adding a -ve check too.
> 

The impact is that kmallocs would immediately fail and give you a big
stack trace.

regards,
dan carpenter

