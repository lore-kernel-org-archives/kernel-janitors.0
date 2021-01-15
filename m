From: Paul Moore <paul@paul-moore.com>
Date: Fri, 15 Jan 2021 17:23:28 +0000
Subject: Re: [PATCH] fs: anon_inodes: rephrase to appropriate kernel-doc
Message-Id: <CAHC9VhSfn9Ux_KcDysAH_vOWhiS3TvPYcXYZLg_5pr9Vee0f2g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210115120342.8849-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210115120342.8849-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Daniel Colascione <dancol@google.com>, Lokesh Gidra <lokeshgidra@google.com>, Eric Biggers <ebiggers@google.com>, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 15, 2021 at 7:03 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit e7e832ce6fa7 ("fs: add LSM-supporting anon-inode interface") adds
> more kerneldoc description, but also a few new warnings on
> anon_inode_getfd_secure() due to missing parameter descriptions.
>
> Rephrase to appropriate kernel-doc for anon_inode_getfd_secure().
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  fs/anon_inodes.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

Merged into selinux/next with the other related LSM/SELinux anon-inode
patches, thank you!

-- 
paul moore
www.paul-moore.com
