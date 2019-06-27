From: Stefan Haberland <sth@linux.ibm.com>
Date: Thu, 27 Jun 2019 14:14:54 +0000
Subject: Re: [PATCH] s390/dasd: Fix a precision vs width bug in dasd_feature_list()
Message-Id: <7b33439f-6f70-74de-0861-91081e6e048d@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190626100658.GB3242@mwanda>
In-Reply-To: <20190626100658.GB3242@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org

On 26.06.19 12:06, Dan Carpenter wrote:
> The "len" variable is the length of the option up to the next option or
> to the end of the string which ever first.  We want to print the invalid
> option so we want precision "%.*s" but the format is width "%*s" so it
> prints up to the end of the string.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.

Thanks for the patch. I tested it and it works as expected.
Will integrate it through the s390 tree.
