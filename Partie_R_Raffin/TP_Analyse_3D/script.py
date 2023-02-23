import pymesh
import matplotlib.pyplot as plt

print("# Imported PyMesh")

def get_occurrence_count(elements):
    occurrence_count = {}
    for element in elements:
        if element in occurrence_count:
            occurrence_count[element] += 1
        else:
            occurrence_count[element] = 1
    return occurrence_count

print("# Loaded Functions")
model = "suzanne"
mesh = pymesh.load_mesh(model + ".obj")
mesh_dec = pymesh.load_mesh(model + "_dec.obj")
mesh_lis = pymesh.load_mesh(model + "_lis.obj")

print("# Loaded Mesh")
print("* mesh:")
print(mesh.num_vertices, mesh.num_faces, mesh.num_voxels)
print("* mesh_dec:")
print(mesh_dec.num_vertices, mesh_dec.num_faces, mesh_dec.num_voxels)
print("* mesh_lic:")
print(mesh_lis.num_vertices, mesh_lis.num_faces, mesh_lis.num_voxels)

print("# Enable Connectivity")
mesh.enable_connectivity();

print("#######################")
print("#######################")

print("# Dic Mesh")
print("* vertex_valance:")
mesh.add_attribute("vertex_valance")
vertex_valance = get_occurrence_count(mesh.get_attribute("vertex_valance"))
plt.bar(list(vertex_valance.keys()), vertex_valance.values(), color='b')
plt.savefig(model + "_valance.png")
print("saved");

print("* vertex_dihedral_angle:")
mesh.add_attribute("vertex_dihedral_angle")
vertex_dihedral_angle = get_occurrence_count(mesh.get_attribute("vertex_dihedral_angle"))
plt.bar(list(vertex_dihedral_angle.keys()), vertex_dihedral_angle.values(), color='b')
plt.savefig(model + "_dihedral.png")
print("saved");

print("#######################")
print("#######################")

print("# Dic Mesh Dec")
print("* vertex_valance:")
mesh_dec.add_attribute("vertex_valance")
vertex_valance = get_occurrence_count(mesh_dec.get_attribute("vertex_valance"))
plt.bar(list(vertex_valance.keys()), vertex_valance.values(), color='b')
plt.savefig(model + "_dec_valance.png")
print("saved");

print("* vertex_dihedral_angle:")
mesh_dec.add_attribute("vertex_dihedral_angle")
vertex_dihedral_angle = get_occurrence_count(mesh_dec.get_attribute("vertex_dihedral_angle"))
plt.bar(list(vertex_dihedral_angle.keys()), vertex_dihedral_angle.values(), color='b')
plt.savefig(model + "_dec_dihedral.png")
print("saved");

print("#######################")
print("#######################")

print("# Dic Mesh Lis")
print("* vertex_valance:")
mesh_lis.add_attribute("vertex_valance")
vertex_valance = get_occurrence_count(mesh_lis.get_attribute("vertex_valance"))
plt.bar(list(vertex_valance.keys()), vertex_valance.values(), color='b')
plt.savefig(model + "_lis_valance.png")
print("saved");

print("* vertex_dihedral_angle:")
mesh_lis.add_attribute("vertex_dihedral_angle")
vertex_dihedral_angle = get_occurrence_count(mesh_lis.get_attribute("vertex_dihedral_angle"))
plt.bar(list(vertex_dihedral_angle.keys()), vertex_dihedral_angle.values(), color='b')
plt.savefig(model + "_lis_dihedral.png")
print("saved");



