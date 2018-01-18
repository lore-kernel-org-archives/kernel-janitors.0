From: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr@gentoo.org>
Date: Thu, 18 Jan 2018 22:06:29 +0000
Subject: [PATCH-next] init/main.c: make local symbol static
Message-Id: <20180118220629.25116-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mingo@kernel.org, akpm@linux-foundation.org, tglx@linutronix.de, keescook@chromium.org, lauraa@codeaurora.org, rostedt@goodmis.org, mhocko@suse.com, thomas.lendacky@amd.com, tal.shorer@gmail.com, viresh.kumar@linaro.org, lokeshvutla@ti.com
Cc: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr@gentoo.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

init/main.c:167:12: warning:
  symbol 'envp_init' was not declared. Should it be static?

Signed-off-by: Christopher D=C3=ADaz Riveros <chrisadr@gentoo.org>
---
 init/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index a8100b954839..ae86addb306c 100644
--- a/init/main.c
+++ b/init/main.c
@@ -164,7 +164,7 @@ static int __init set_reset_devices(char *str)
 __setup("reset_devices", set_reset_devices);
=20
 static const char *argv_init[MAX_INIT_ARGS+2] =3D { "init", NULL, };
-const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=3Dlinux", N=
ULL, };
+static const char *envp_init[MAX_INIT_ENVS+2] =3D { "HOME=3D/", "TERM=3Dli=
nux", NULL, };
 static const char *panic_later, *panic_param;
=20
 extern const struct obs_kernel_param __setup_start[], __setup_end[];
--=20
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
