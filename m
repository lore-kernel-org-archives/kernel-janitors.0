From: David Miller <davem@davemloft.net>
Date: Tue, 04 Aug 2020 23:06:40 +0000
Subject: Re: [PATCH] selftests/net: skip msg_zerocopy test if we have less than 4 CPUs
Message-Id: <20200804.160640.1136854489642887881.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804123012.378750-1-colin.king@canonical.com>
In-Reply-To: <20200804123012.378750-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com, willemb@google.com
Cc: shuah@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  4 Aug 2020 13:30:12 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The current test will exit with a failure if it cannot set affinity on
> specific CPUs which is problematic when running this on single CPU
> systems. Add a check for the number of CPUs and skip the test if
> the CPU requirement is not met.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Willem, please review.
