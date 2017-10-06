From: David Miller <davem@davemloft.net>
Date: Fri, 06 Oct 2017 04:29:36 +0000
Subject: Re: [PATCH net] selftests/net: rxtimestamp: Fix an off by one
Message-Id: <20171005.212936.1533429317037705562.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005125347.otplfss4mo7hfopv@mwanda>
In-Reply-To: <20171005125347.otplfss4mo7hfopv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: shuah@kernel.org, maloney@google.com, willemb@google.com, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 5 Oct 2017 15:53:47 +0300

> The > should be >= so that we don't write one element beyond the end of
> the array.
> 
> Fixes: 16e781224198 ("selftests/net: Add a test to validate behavior of rx timestamps")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
