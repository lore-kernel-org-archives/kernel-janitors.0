From: Mike Waychison <mikew@google.com>
Date: Fri, 18 Mar 2011 09:24:18 +0000
Subject: Re: [patch 2/2] efivars: handle errors from register_efivars()
Message-Id: <AANLkTi=HYEN16eSS1LqFcY-TO6=K=QzrrmDABXL48KpE@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110318071238.GW2008@bicker>
In-Reply-To: <20110318071238.GW2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Mike Waychison <mikew@google.com>, Chris Wright <chrisw@sous-sol.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 18, 2011 at 12:12 AM, Dan Carpenter <error27@gmail.com> wrote:
> We should unwind and return an error if register_efivars() fails.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mike Waychison <mikew@google.com>
