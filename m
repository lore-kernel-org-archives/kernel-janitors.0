From: David Miller <davem@davemloft.net>
Date: Wed, 13 Nov 2019 22:33:39 +0000
Subject: Re: [PATCH] net: atlantic: Signedness bug in aq_vec_isr_legacy()
Message-Id: <20191113.143339.63552073098179182.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113183158.rogxsza632ppeen3@kili.mountain>
In-Reply-To: <20191113183158.rogxsza632ppeen3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: irusskikh@marvell.com, ndanilov@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2019 21:31:58 +0300

> irqreturn_t type is an enum and in this context it's unsigned, so "err"
> can't be irqreturn_t or it breaks the error handling.  In fact the "err"
> variable is only used to store integers (never irqreturn_t) so it should
> be declared as int.
> 
> I removed the initialization because it's not required.  Using a bogus
> initializer turns off GCC's uninitialized variable warnings.  Secondly,
> there is a GCC warning about unused assignments and we would like to
> enable that feature eventually so we have been trying to remove these
> unnecessary initializers.
> 
> Fixes: 7b0c342f1f67 ("net: atlantic: code style cleanup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
