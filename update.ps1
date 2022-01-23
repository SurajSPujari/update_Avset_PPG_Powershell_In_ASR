$Vname = Get-AzRecoveryServicesVault -ResourceGroupName "rgname" -Name "rgvname"
Set-AzRecoveryServicesAsrVaultSettings -vault $Vname

$fabric=Get-AzRecoveryServicesAsrFabric -name "Name of fabric"
$ProtectionContainers = Get-AzRecoveryServicesAsrProtectionContainer -Fabric $fabric
$ReplicationProtectedItems = Get-AzRecoveryServicesAsrReplicationProtectedItem -ProtectionContainer $ProtectionContainers |  where { $_.FriendlyName -eq "vmname"}
#$recPpg = Get-AzproximityPlacementGroup -Name "ppgname"
#$recAv = Get-AzAvailabilitySet -ResourceGroupName "rgname" -Name "avsname"
$currentJob = Set-AzRecoveryServicesAsrReplicationProtectedItem -ReplicationProtectedItem $ReplicationProtectedItems -RecoveryProximityPlacementGroupId $recPpg.ID -RecoveryAvailabilitySet $recAv.ID
