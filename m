From: Christian Brauner <christian.brauner@ubuntu.com>
Date: Fri, 11 Sep 2020 10:55:04 +0000
Subject: Re: [PATCH][next] binder: remove redundant assignment to pointer n
Message-Id: <20200911105504.zlovcoikrpip66aq@wittgenstein>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200910151221.751464-1-colin.king@canonical.com>
In-Reply-To: <20200910151221.751464-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, Hridya Valsaraju <hridya@google.com>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>

On Thu, Sep 10, 2020 at 04:12:21PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer n is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
