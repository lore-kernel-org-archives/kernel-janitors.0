From: Jason Vas Dias <jason.vas.dias@gmail.com>
Date: Sun, 19 Feb 2017 15:35:54 +0000
Subject: [PATCH] arch/x86/kernel/tsc.c : set X86_FEATURE_ART for TSC on CPUs like i7-4910MQ : bug #194609
Message-Id: <CALyZvKwVDP8bTDdteYZT01GJGDd0d+hQ7oib-oXj+DarNHMWnQ@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="001a114dd0621b67780548e3e763"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com>
In-Reply-To: <CALyZvKyAH8xfj_j2Vh_z2BOgYJeP73LvFwhvQ26-Kyfthdtwiw@mail.gmail.com>
To: kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Prarit Bhargava <prarit@redhat.com>, x86@kernel.org

--001a114dd0621b67780548e3e763
Content-Type: text/plain; charset=UTF-8

Patch to make tsc.c set X86_FEATURE_ART and setup the TSC_ADJUST MSR
correctly on my "i7-4910MQ" CPU, which reports
( boot_cpu_data.cpuid_level==0x13  &&
  boot_cpu_data.extended_cpuid_level==0x80000008
), so the code didn't think it supported CPUID:15h, but it does .

Patch:
<quote><code><pre><patch>
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 46b2f41..f76cca8 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1030,6 +1030,7 @@ core_initcall(cpufreq_register_tsc_scaling);
 #endif /* CONFIG_CPU_FREQ */

 #define ART_CPUID_LEAF (0x15)
+#define MINIMUM_CPUID_EXTENDED_LEAF_THAT_MUST_HAVE_ART (0x80000008)
 #define ART_MIN_DENOMINATOR (1)


@@ -1038,24 +1039,43 @@ core_initcall(cpufreq_register_tsc_scaling);
  */
 static void detect_art(void)
 {
-	unsigned int unused[2];
-
-	if (boot_cpu_data.cpuid_level < ART_CPUID_LEAF)
-		return;
-
-	cpuid(ART_CPUID_LEAF, &art_to_tsc_denominator,
-	      &art_to_tsc_numerator, unused, unused+1);
-
+	unsigned int v[2];
+
+	if(boot_cpu_data.cpuid_level < ART_CPUID_LEAF)
+        {
+                if(boot_cpu_data.extended_cpuid_level >=
MINIMUM_CPUID_EXTENDED_LEAF_THAT_MUST_HAVE_ART)
+                {
+                        pr_info("Would normally not use ART -
cpuid_level:%d < %d - but extended_cpuid_level is: %x, so probing for
ART support.\n",
+                        boot_cpu_data.cpuid_level, ART_CPUID_LEAF,
boot_cpu_data.extended_cpuid_level);
+                }else
+                        return;
+        }
+
+        cpuid(ART_CPUID_LEAF, &art_to_tsc_denominator,
+              &art_to_tsc_numerator, v, v+1);
+
 	/* Don't enable ART in a VM, non-stop TSC required */
 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR) ||
-	    !boot_cpu_has(X86_FEATURE_NONSTOP_TSC) ||
-	    art_to_tsc_denominator < ART_MIN_DENOMINATOR)
-		return;
-
-	if (rdmsrl_safe(MSR_IA32_TSC_ADJUST, &art_to_tsc_offset))
-		return;
-
+           !boot_cpu_has(X86_FEATURE_NONSTOP_TSC) ||
+	   art_to_tsc_denominator < ART_MIN_DENOMINATOR)
+        {
+                pr_info("Not using Intel ART for TSC - HYPERVISOR:%d
NO NONSTOP_TSC:%d  bad TSC/Crystal ratio denominator: %d.",
boot_cpu_has(X86_FEATURE_HYPERVISOR),
!boot_cpu_has(X86_FEATURE_NONSTOP_TSC), art_to_tsc_denominator );
+                return;
+        }
+	if (  (v[0]=rdmsrl_safe(MSR_IA32_TSC_ADJUST,
&art_to_tsc_offset))!=0) /* will get fault on first read if nothing
written yet */
+        {
+                if((v[1]=wrmsrl_safe(MSR_IA32_TSC_ADJUST, 0))!=0)
+                {
+                        pr_info("Not using Intel ART for TSC - failed
to initialize TSC_ADJUST: %d %d.\n", v[0], v[1] );
+                        return;
+                }else
+                {
+                        art_to_tsc_offset = 0; /* perhaps initalize
to -1 * current rdtsc value ? */
+                        pr_info("Using Intel ART for TSC - TSC_ADJUST
initialized to %llu.\n",art_to_tsc_offset);
+                }
+        }
 	/* Make this sticky over multiple CPU init calls */
+        pr_info("Using Intel Always Running Timer (ART) feature %x
for TSC on all CPUs - TSC/CCC: %d/%d offset: %llu.\n",
X86_FEATURE_ART, art_to_tsc_numerator, art_to_tsc_denominator,
art_to_tsc_offset );
 	setup_force_cpu_cap(X86_FEATURE_ART);
 }
</patch></quote></code></pre>

I originally reported this issue on bugzilla.kernel.org : bug # 194609 :
https://bugzilla.kernel.org/show_bug.cgi?id=194609
, but it was not posted to the list , & then I posted it to the list, but
Julia Lawell <julia.lawall@lip6.fr> kindly suggested I should re-post with
patch inline, & include extra recipients, which includes the last
person to modify tsc.c (Prarit), so am doing so.

My CPU reports 'model name' as
"Intel(R) Core(TM) i7-4910MQ CPU @ 2.90GHz" ,
has 4 physical & 8 hyperthreading cores with a frequency scalable from 800000
to 3900000 (/sys/devices/system/cpu/cpu0/cpufreq/scaling_{min,max}_freq) , and
flags :
fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1
sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
rdrand lahf_lm abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase
tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm xsaveopt dtherm
ida arat pln pts

$ cat /sys/devices/system/clocksource/clocksource0/current_clocksource
tsc
$

CPUID:15H is available in user-space, returning the integers : ( 7,
832, 832 ) in EAX:EBX:ECX , yet boot_cpu_data.cpuid_level is 13 , so
in detect_art() in tsc.c,
Linux does not think ART is enabled, and does not set the synthesized CPUID +
((3*32)+10) bit, so a program looking at /dev/cpu/0/cpuid would not
see this bit set .
if an e1000 NIC card had been installed, PTP would not be available.
Also, if the MSR TSC_ADJUST has not yet been written, as it seems to be
nowhere else in Linux,  the code will always think X86_FEATURE_ART is 0
because the CPU will always get a fault reading the MSR since it has
never been written.

So the attached patch makes tsc.c set X86_FEATURE_ART correctly in tsc.c ,
and set the TSC_ADJUST to 0 if the rdmsr gets an error .
Please consider applying it to a future linux version.

It would be nice for user-space programs that want to use the TSC with
rdtsc / rdtscp instructions, such as the demo program attached to the
bug report,
could have confidence that Linux is actually generating the results of
clock_gettime(CLOCK_MONOTONIC_RAW, &timespec)
in a predictable way from the TSC by looking at the
 /dev/cpu/0/cpuid[bit(((3*32)+10)] value before enabling user-space
use of TSC values, so that they can correlate TSC values with linux
clock_gettime() values.

The patch applies to linux kernels v4.8 & v4.9.10 GIT tags  and the
kernels build
and run & the demo program produces results like :
 $ ./ttsc1
has tsc: 1 constant: 1
832 / 7 = 118 : 832 - 9.888914286E+04hz : OK:1
Hooray! TSC is enabled with KHz: 2893300
ts2 - ts1: 261 ts3 - ts2: 211 ns1: 0.000000146 ns2: 0.000001629
ts3 - ts2: 27 ns1: 0.000000168
ts3 - ts2: 20 ns1: 0.000000147
ts3 - ts2: 14 ns1: 0.000000152
ts3 - ts2: 15 ns1: 0.000000151
ts3 - ts2: 15 ns1: 0.000000153
ts3 - ts2: 15 ns1: 0.000000150
ts3 - ts2: 20 ns1: 0.000000148
ts3 - ts2: 19 ns1: 0.000000164
ts3 - ts2: 19 ns1: 0.000000164
ts3 - ts2: 19 ns1: 0.000000160
t1 - t0: 52901 - ns2: 0.000053951

The value 'ts3 - ts2' is the number of nanoseconds measured by
successive calls to
'rdtscp'; the 'ns1' value is the number of nanoseconds (shown as
decimal seconds)
measured by
  clock_gettime(CLOCK_MONOTONIC_RAW, &ts2) -
  clock_gettime(CLOCK_MONOTONIC_RAW, &ts1)
when casting each {ts.tv_sec, ts.tv_nsec} to a 128 bit long long integer .
It shows a user-space program can read the TSC with a latency of @20ns
but can only measure times >= @ 140ns using Linux clock_gettime()  on this CPU.

Please make Linux provide some help to programs that want to use the
TSC from user-space by applying the patch so they can determine with
confidence that Linux
is supplying TSC values with a predictable conversion function in response to
clock_gettime(CLOCK_MONOTONIC_RAW,&ts) system calls. It would also
be nice if it actually exported the 'Refined TSC calibrated frequency'
(tsc_khz)
in sysfs , but that's another story.

Best Regards,
Jason

--001a114dd0621b67780548e3e763
Content-Type: application/octet-stream; name="x86_kernel_tsc-bz194609.patch"
Content-Disposition: attachment; filename="x86_kernel_tsc-bz194609.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC90c2MuYyBiL2FyY2gveDg2L2tlcm5lbC90c2Mu
YwppbmRleCA0NmIyZjQxLi5mNzZjY2E4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvdHNj
LmMKKysrIGIvYXJjaC94ODYva2VybmVsL3RzYy5jCkBAIC0xMDMwLDYgKzEwMzAsNyBAQCBjb3Jl
X2luaXRjYWxsKGNwdWZyZXFfcmVnaXN0ZXJfdHNjX3NjYWxpbmcpOwogI2VuZGlmIC8qIENPTkZJ
R19DUFVfRlJFUSAqLwogCiAjZGVmaW5lIEFSVF9DUFVJRF9MRUFGICgweDE1KQorI2RlZmluZSBN
SU5JTVVNX0NQVUlEX0VYVEVOREVEX0xFQUZfVEhBVF9NVVNUX0hBVkVfQVJUICgweDgwMDAwMDA4
KQogI2RlZmluZSBBUlRfTUlOX0RFTk9NSU5BVE9SICgxKQogCiAKQEAgLTEwMzgsMjQgKzEwMzks
NDMgQEAgY29yZV9pbml0Y2FsbChjcHVmcmVxX3JlZ2lzdGVyX3RzY19zY2FsaW5nKTsKICAqLwog
c3RhdGljIHZvaWQgZGV0ZWN0X2FydCh2b2lkKQogewotCXVuc2lnbmVkIGludCB1bnVzZWRbMl07
Ci0KLQlpZiAoYm9vdF9jcHVfZGF0YS5jcHVpZF9sZXZlbCA8IEFSVF9DUFVJRF9MRUFGKQotCQly
ZXR1cm47Ci0KLQljcHVpZChBUlRfQ1BVSURfTEVBRiwgJmFydF90b190c2NfZGVub21pbmF0b3Is
Ci0JICAgICAgJmFydF90b190c2NfbnVtZXJhdG9yLCB1bnVzZWQsIHVudXNlZCsxKTsKLQorCXVu
c2lnbmVkIGludCB2WzJdOworCisJaWYoYm9vdF9jcHVfZGF0YS5jcHVpZF9sZXZlbCA8IEFSVF9D
UFVJRF9MRUFGKQorICAgICAgICB7CisgICAgICAgICAgICAgICAgaWYoYm9vdF9jcHVfZGF0YS5l
eHRlbmRlZF9jcHVpZF9sZXZlbCA+PSBNSU5JTVVNX0NQVUlEX0VYVEVOREVEX0xFQUZfVEhBVF9N
VVNUX0hBVkVfQVJUKQorICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgICAg
IHByX2luZm8oIldvdWxkIG5vcm1hbGx5IG5vdCB1c2UgQVJUIC0gY3B1aWRfbGV2ZWw6JWQgPCAl
ZCAtIGJ1dCBleHRlbmRlZF9jcHVpZF9sZXZlbCBpczogJXgsIHNvIHByb2JpbmcgZm9yIEFSVCBz
dXBwb3J0LlxuIiwKKyAgICAgICAgICAgICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEuY3B1aWRf
bGV2ZWwsIEFSVF9DUFVJRF9MRUFGLCBib290X2NwdV9kYXRhLmV4dGVuZGVkX2NwdWlkX2xldmVs
KTsKKyAgICAgICAgICAgICAgICB9ZWxzZQorICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
OworICAgICAgICB9ICAgICAgICAgICAgICAgIAorCisgICAgICAgIGNwdWlkKEFSVF9DUFVJRF9M
RUFGLCAmYXJ0X3RvX3RzY19kZW5vbWluYXRvciwKKyAgICAgICAgICAgICAgJmFydF90b190c2Nf
bnVtZXJhdG9yLCB2LCB2KzEpOworICAgICAgICAKIAkvKiBEb24ndCBlbmFibGUgQVJUIGluIGEg
Vk0sIG5vbi1zdG9wIFRTQyByZXF1aXJlZCAqLwogCWlmIChib290X2NwdV9oYXMoWDg2X0ZFQVRV
UkVfSFlQRVJWSVNPUikgfHwKLQkgICAgIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9OT05TVE9Q
X1RTQykgfHwKLQkgICAgYXJ0X3RvX3RzY19kZW5vbWluYXRvciA8IEFSVF9NSU5fREVOT01JTkFU
T1IpCi0JCXJldHVybjsKLQotCWlmIChyZG1zcmxfc2FmZShNU1JfSUEzMl9UU0NfQURKVVNULCAm
YXJ0X3RvX3RzY19vZmZzZXQpKQotCQlyZXR1cm47Ci0KKyAgICAgICAgICAgIWJvb3RfY3B1X2hh
cyhYODZfRkVBVFVSRV9OT05TVE9QX1RTQykgfHwKKwkgICBhcnRfdG9fdHNjX2Rlbm9taW5hdG9y
IDwgQVJUX01JTl9ERU5PTUlOQVRPUikKKyAgICAgICAgeworICAgICAgICAgICAgICAgIHByX2lu
Zm8oIk5vdCB1c2luZyBJbnRlbCBBUlQgZm9yIFRTQyAtIEhZUEVSVklTT1I6JWQgIE5PIE5PTlNU
T1BfVFNDOiVkICBiYWQgVFNDL0NyeXN0YWwgcmF0aW8gZGVub21pbmF0b3I6ICVkLiIsIGJvb3Rf
Y3B1X2hhcyhYODZfRkVBVFVSRV9IWVBFUlZJU09SKSwgIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVS
RV9OT05TVE9QX1RTQyksIGFydF90b190c2NfZGVub21pbmF0b3IgKTsKKyAgICAgICAgICAgICAg
ICByZXR1cm47CisgICAgICAgIH0KKwlpZiAoICAodlswXT1yZG1zcmxfc2FmZShNU1JfSUEzMl9U
U0NfQURKVVNULCAmYXJ0X3RvX3RzY19vZmZzZXQpKSE9MCkgLyogd2lsbCBnZXQgZmF1bHQgb24g
Zmlyc3QgcmVhZCBpZiBub3RoaW5nIHdyaXR0ZW4geWV0ICovCisgICAgICAgIHsKKyAgICAgICAg
ICAgICAgICBpZigodlsxXT13cm1zcmxfc2FmZShNU1JfSUEzMl9UU0NfQURKVVNULCAwKSkhPTAp
CisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAgICAgICAgICAgcHJfaW5mbygiTm90
IHVzaW5nIEludGVsIEFSVCBmb3IgVFNDIC0gZmFpbGVkIHRvIGluaXRpYWxpemUgVFNDX0FESlVT
VDogJWQgJWQuXG4iLCB2WzBdLCB2WzFdICk7CisgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm47CisgICAgICAgICAgICAgICAgfWVsc2UKKyAgICAgICAgICAgICAgICB7CisgICAgICAgICAg
ICAgICAgICAgICAgICBhcnRfdG9fdHNjX29mZnNldCA9IDA7IC8qIHBlcmhhcHMgaW5pdGFsaXpl
IHRvIC0xICogY3VycmVudCByZHRzYyB2YWx1ZSA/ICovCisgICAgICAgICAgICAgICAgICAgICAg
ICBwcl9pbmZvKCJVc2luZyBJbnRlbCBBUlQgZm9yIFRTQyAtIFRTQ19BREpVU1QgaW5pdGlhbGl6
ZWQgdG8gJWxsdS5cbiIsYXJ0X3RvX3RzY19vZmZzZXQpOworICAgICAgICAgICAgICAgIH0KKyAg
ICAgICAgfQogCS8qIE1ha2UgdGhpcyBzdGlja3kgb3ZlciBtdWx0aXBsZSBDUFUgaW5pdCBjYWxs
cyAqLworICAgICAgICBwcl9pbmZvKCJVc2luZyBJbnRlbCBBbHdheXMgUnVubmluZyBUaW1lciAo
QVJUKSBmZWF0dXJlICV4IGZvciBUU0Mgb24gYWxsIENQVXMgLSBUU0MvQ0NDOiAlZC8lZCBvZmZz
ZXQ6ICVsbHUuXG4iLCBYODZfRkVBVFVSRV9BUlQsIGFydF90b190c2NfbnVtZXJhdG9yLCBhcnRf
dG9fdHNjX2Rlbm9taW5hdG9yLCBhcnRfdG9fdHNjX29mZnNldCApOwogCXNldHVwX2ZvcmNlX2Nw
dV9jYXAoWDg2X0ZFQVRVUkVfQVJUKTsKIH0KIAo=
--001a114dd0621b67780548e3e763--
