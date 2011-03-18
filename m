From: Mike Waychison <mikew@google.com>
Date: Fri, 18 Mar 2011 09:23:00 +0000
Subject: Re: [patch 1/2] efivars: memory leak on error in create_efivars_bin_attributes()
Message-Id: <AANLkTim7uAt_TR9XCZkPBDo7VwfNqvFSguKYndzyw0P7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110318071214.GV2008@bicker>
In-Reply-To: <20110318071214.GV2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Mike Waychison <mikew@google.com>, Chris Wright <chrisw@sous-sol.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 18, 2011 at 12:12 AM, Dan Carpenter <error27@gmail.com> wrote:
> This is a cut and paste bug. =A0We intended to free ->del_var and
> ->new_var but we only free ->new_var.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mike Waychison <mikew@google.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
