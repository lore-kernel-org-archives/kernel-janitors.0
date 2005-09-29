From: ucko@debian.org (Aaron M. Ucko)
Date: Thu, 29 Sep 2005 21:59:18 +0000
Subject: [KJ] cpufreq: honor cpu_sibling_map in speedstep-centrino.c
Message-Id: <udl4q83r0w9.fsf@tux64.internal.ucko.debian.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5107949513973471=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5107949513973471==
Content-Type: text/plain; charset=us-ascii

speedstep-centrino.c should honor cpu_sibling_map for the sake of
recent Intel processors, which support both Centrino-style Enhanced
SpeedStep and hyperthreading; even newer dual-core chips may need the
same fix.

--- /usr/src/linux-source-2.6.13.2/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~	2005-08-28 19:41:01.000000000 -0400
+++ /usr/src/linux-source-2.6.13.2/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-09-28 17:23:37.000000000 -0400
@@ -498,6 +498,10 @@
 	if (cpu->x86_vendor != X86_VENDOR_INTEL || !cpu_has(cpu, X86_FEATURE_EST))
 		return -ENODEV;
 
+#ifdef CONFIG_SMP
+	policy->cpus = cpu_sibling_map[policy->cpu];
+#endif
+
 	for (i = 0; i < N_IDS; i++)
 		if (centrino_verify_cpu_id(cpu, &cpu_ids[i]))
 			break;


-- 
Aaron M. Ucko, KB1CJC (amu at alum.mit.edu, ucko at debian.org)
Finger amu@monk.mit.edu (NOT a valid e-mail address) for more info.

--===============5107949513973471==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5107949513973471==--
