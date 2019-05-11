From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 11 May 2019 09:36:48 +0000
Subject: Re: [PATCH] mspro_block: Fix an error code in mspro_block_issue_req()
Message-Id: <20190511093648.GF18105@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190510112440.GA22858@mwanda>
In-Reply-To: <20190510112440.GA22858@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

return -EINVAL; is more readable (100% unambiguous) than a break
statement.

ergards,
dan carpenter
